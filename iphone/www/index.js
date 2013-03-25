var f=function(){
  //写日志
	window.writeLog = function(){
      native.log.write('This is a log');
	}
  //获取设备信息
  window.getDeviceInfo = function(){
      native.device.getDeviceInfo(function(_result){
                                  alert(JSON.stringify(_result));
                             });
  }
  //Native alert
  window.nativeAlert = function(){
    native.notification.alert('This is a dialog','title here','ok');
  }
  //Native confirm
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