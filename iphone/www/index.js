var f=function(){
	window.writeLog = function(){
		neh.log.write(document.getElementById('ipt').value);
	}
  window.getDeviceInfo = function(){
    neh.device.getDeviceInfo(function(_result){
                              alert(JSON.stringify(_result));
                             });
  }
}
define(['{lib}hybrid/ios/log.js',
        '{lib}hybrid/ios/device.js'],f)