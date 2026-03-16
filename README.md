@'
# 🧹 Windows 11 CleanUp Suite GUI

![Platform](https://img.shields.io/badge/platform-Windows%2011%20%7C%2010-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)

Una suite di manutenzione professionale con interfaccia grafica (GUI) progettata per mantenere Windows 11 scattante e pulito. Sostituisce i vecchi script .bat con un'applicazione moderna e centralizzata.

## ✨ Funzionalità principali
- **🔹 Pulizia Base**: Elimina i file temporanei dell'utente e del sistema.
- **🔹 Pulizia Profonda**: Rimuove la cache Prefetch e i file di log accumulati.
- **🔹 Pulizia Massima**: Esegue il ripristino dell'integrità del sistema (`SFC`) e la pulizia avanzata dell'immagine di Windows (`DISM`).

## ⚠️ IMPORTANTE: Come avviare il programma
Per funzionare correttamente, l'applicazione deve avere i permessi per modificare le cartelle di sistema:
1. Scarica il file **`CleanUpSuite.exe`**.
2. Fai click con il tasto destro sul file.
3. Seleziona **"Esegui come amministratore"**.

## ⚖️ Disclaimer (Responsabilità)
Questo software viene fornito "così com'è", senza garanzie di alcun tipo. L'autore **non è responsabile** per eventuali danni, perdite di dati o problemi derivanti dall'uso dell'applicazione. L'utente accetta di utilizzare lo strumento a proprio rischio. Si consiglia vivamente di creare un punto di ripristino prima di eseguire la "Pulizia Massima".

---
*Sviluppato da [ilnanny75](https://github.com/ilnanny75)*
'@ | Out-File -FilePath "README.md" -Encoding utf8