exports.onExecutePostLogin = async (event, api) => {
    if (event.connection.name !== "TAMU-NetID") {
      api.multifactor.enable("any");
    };
  };