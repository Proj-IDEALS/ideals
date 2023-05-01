function (user, context, callback) {
    if(context.connection === "TAMU-NetID"){
      if ('roles' in user) {
      if (user.roles[0] === "User") {
        return callback(null, user, context);
          }
      } else {
        return callback(new UnauthorizedError('Access denied.'));
      }
     
    }else{
      return callback(null, user, context);
        }
    }