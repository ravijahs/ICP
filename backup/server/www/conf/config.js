window.sso = {
    enable: false,
    config: {
    	clientID: "",
    	resourceServerURLs: [],
    	signInRedirectURL: "",
    	storage: "webWorker",
    },
    usernameAttribute: "sub",
    adminGroupAttribute: "",
    allowedAdminGroups: [],
};

window.userStore = {
    type : "file_based"
};

window.userAccess = {
    makeNonAdminUsersReadOnly: false
};

