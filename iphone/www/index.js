var f=function(){
  var _  = NEJ.P,
      _v = _('nej.v');
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
  _v._$addEvent('btnWriteLog','tap',writeLog);
  _v._$addEvent('btnGetDeviceInfo','tap',getDeviceInfo);
  _v._$addEvent('btnAlert','tap',nativeAlert);
  _v._$addEvent('btnConfirm','tap',nativeConfirm);
  
}
define(['{lib}hybrid/ios/log.js',
        '{lib}hybrid/ios/device.js',
        '{lib}hybrid/ios/notification.js',
        '{lib}util/gesture/tap.js'
        ],f)