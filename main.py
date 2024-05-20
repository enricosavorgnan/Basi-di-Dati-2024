import mysql.connector
import streamlit as st
import pandas as pd
import time
from datetime import date

# Connessione al database
vitapharma_db = mysql.connector.connect(host='localhost', user='root', password='Es26112003!!', database='vitapharma')

# Titolo e sottotitolo
st.title(':pill: VitaPharmaDB :pill:')
st.subheader("Il tuo gestionale per la farmacia", divider='rainbow')

# 5 operazioni
operation = st.selectbox('Quale operazione vuoi fare ?',
                         ('Cerca informazioni sulla ricetta',
                          'Inserisci un acquisto',
                          'Mostra i farmaci in via di esaurimento',
                          'Mostra i guadagni dell\'ultimo mese',
                          'Elimina gli acquisti più vecchi di un anno'),
                         index=None, placeholder='Scegli un\'operazione')

# OPERAZIONI

# Operazione 1: Cercare informazioni sulla ricetta
if operation == 'Cerca informazioni sulla ricetta':
    st.subheader('Cerca informazioni sulla ricetta')
    ricetta = st.text_input('Inserisci il codice della ricetta', placeholder='1')
    if st.button('Cerca'):
        cursor = vitapharma_db.cursor()
        cursor.callproc('infoRicetta', [int(ricetta)])
        for result in cursor.stored_results():
            df = pd.DataFrame(result.fetchall())
            df.columns = ['Codice Ricetta', 'Nome farmaco', 'Prezzo', 'Fascia', 'Armadio', 'Scaffale', 'Generico']
            df.index += 1
            st.write(df)

# Operazione 2: Inserire un acquisto
elif operation == 'Inserisci un acquisto':

    # Converte la stringa in input in una lista di float
    def parse_input_values(input_values):
        try:
            return [int(float(value.strip())) for value in input_values.split(",")]
        except ValueError:
            st.error("Please enter valid numbers separated by commas.")
            return []

    # Funzione per inserire l'acquisto  nel database
    def insert_purchase_function():
        st.write('...sto inserendo l\'acquisto...')
        data = date.today()
        ora = time.strftime('%H:%M:%S')
        vt_cursor = vitapharma_db.cursor()

        try:
            vitapharma_db.start_transaction()
            vt_cursor.callproc('insertAcquisto', [data, ora])
            for i in range(len(st.session_state['farmaci'][0])):
                vt_cursor.callproc('insertVendita', [int(st.session_state['farmaci'][0][i]), int(st.session_state['quantita'][0][i])])
            vitapharma_db.commit()
        except mysql.connector.Error as e:
            vitapharma_db.rollback()
            st.session_state['farmaci'] = []
            st.session_state['quantita'] = []
            st.session_state.check_f = False
            st.session_state.check_q = False
            st.error(f"Acquisto non inserito! \n Error: {e}")
            return

        st.write('Acquisto inserito con successo!')
        st.session_state['farmaci'] = []
        st.session_state['quantita'] = []
        st.session_state.check_f = False
        st.session_state.check_q = False
        return

    # Interfaccia per inserire i dati dell'acquisto
    st.subheader('Inserisci un acquisto', divider='rainbow')
    if 'farmaci' not in st.session_state:
        st.session_state['farmaci'] = []
        st.session_state.check_f = False
        my_check_f = False
    if 'quantita' not in st.session_state:
        st.session_state['quantita'] = []
        st.session_state.check_q = False
        my_check_q = False

    input_f = st.text_input("Inserisci i codici dei Farmaci (comma-separated)")
    if st.button("Inserisci i farmaci", key='f_i') and not st.session_state.check_f:
        st.session_state.check_f = True
        my_check_f = True
        values_to_add = parse_input_values(input_f)
        if values_to_add:
            st.session_state['farmaci'].append(values_to_add)
            st.success(f"Farmaci {values_to_add} aggiunti!")

    input_q = st.text_input("Inserisci le quantità per ciascun farmaco (comma-separated)")
    if st.button("Inserisci le quantità") and not st.session_state.check_q:
        st.session_state.check_q = True
        my_check_q = True
        values_to_add = parse_input_values(input_q)
        if values_to_add:
            st.session_state['quantita'].append(values_to_add)
            st.success(f"Quantità {values_to_add} aggiunte!")

    # Mostra i contenuti degli array Farmaci e Quantità
    if st.button('Inserisci l\'acquisto'):
        df = pd.DataFrame((st.session_state['farmaci'][0], st.session_state['quantita'][0]), index=['Codice farmaco', 'Quantità'])
        st.write(df)
        insert_purchase_function()


# Operazione 3: Mostrare i farmaci in via di esaurimento
elif operation == 'Mostra i farmaci in via di esaurimento':
    st.subheader('Mostra i farmaci in via di esaurimento')
    cursor = vitapharma_db.cursor()
    cursor.callproc('showMissing')
    for result in cursor.stored_results():
        df = pd.DataFrame(result.fetchall())
        df.columns = ['Codice farmaco', 'Nome farmaco', 'Disponibilità', 'Fornitore più economico', 'Costo']
        df.index += 1
        st.write(df)


# Operazione 4: Mostrare i guadagni dell'ultimo mese
elif operation == 'Mostra i guadagni dell\'ultimo mese':
    st.subheader('Mostra i guadagni dell\'ultimo mese')
    cursor = vitapharma_db.cursor()
    cursor.callproc('showEarnings')
    for result in cursor.stored_results():
        df = pd.DataFrame(result.fetchall())
        df.columns = ['Guadagno']
        df.index += 1
        st.write(df)


# Operazione 5: Eliminare gli acquisti più vecchi di un anno
elif operation == 'Elimina gli acquisti più vecchi di un anno':
    st.subheader('Elimina gli acquisti più vecchi di un anno')
    if st.button('Elimina'):
        cursor = vitapharma_db.cursor()
        cursor.callproc('deleteAcquistiSP')
        vitapharma_db.commit()
        st.write('Acquisti eliminati con successo!')
