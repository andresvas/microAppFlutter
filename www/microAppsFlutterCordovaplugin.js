var exec = require('cordova/exec');

exports.openMicroApp = function (isModal, route, entryPoint, success, error) {
    exec(success, error, 'microAppsFlutterCordovaplugin', 'openMicroApp', [isModal, route, entryPoint]);
};


/*
	run microApp script

	        document.getElementById("buttonMicroApp").onclick = function(){
            cordova.plugins.microAppsFlutterCordovaplugin.openMicroApp(true,"", [],function(res){
                console.log(res);
            }, function(err){
                console.log(err);
            })
          };

*/
