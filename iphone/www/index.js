var f=function(){
	window.writeLog = function(){
      native.log.write('This is a log');
	}
  window.getDeviceInfo = function(){
      native.device.getDeviceInfo(function(_result){
                                  alert(JSON.stringify(_result));
                             });
  }
  window.nativeAlert = function(){
    native.notification.alert('This is a dialog','title here','ok');
  }
  window.nativeConfirm = function(){
    native.notification.confirm('This is a dialog','title here','ok,cancel',function(_result){
                                        alert(_result.data.index);
                                });
  }
}
define(['{lib}hybrid/ios/log.js',
        '{lib}hybrid/ios/device.js',
        '{lib}hybrid/ios/notification.js'
        ],f)