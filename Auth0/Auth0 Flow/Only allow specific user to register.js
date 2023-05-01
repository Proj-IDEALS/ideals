exports.onExecutePreUserRegistration = async (event, api) => {const allowedEmails = ['user1@example.com', 'user2@example.com', 'user3@example.com'];
if (event.connection.name === "TAMU-NetID") {
if (allowedEmails.indexOf(event.user.email) !== -1) {
    
    // localize the error message 
    const LOCALIZED_MESSAGES = {
      en: 'You are not allowed to register.',
      es: 'No tienes permitido registrarte.'
    };

    const userMessage = LOCALIZED_MESSAGES[event.request.language] || LOCALIZED_MESSAGES['en'];
    api.access.deny('Access Denied', userMessage);
  }}
};