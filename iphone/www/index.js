var f=function(){
	window.writeLog = function(){
    for(var i=0;i<10;i++){
      neh.log.write(i+'');
    }
	}
  window.getDeviceInfo = function(){
    neh.device.getDeviceInfo(function(_result){
                              alert(JSON.stringify(_result));
                             });
  }
}
define(['{lib}hybrid/ios/log.js',
        '{lib}hybrid/ios/device.js'],f)