" Creates plugin's command
command! SessionCreate lua require('sessions').create_session()
command! SessionList   lua require('sessions').list_sessions()
