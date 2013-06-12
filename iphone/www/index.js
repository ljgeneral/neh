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
  
  //Native Navigation
  window.nativeNavigation = function(){
    native.navigation.navigateToURL('second.html');
  }
  
  //Native Navigation Back
  window.nativeNavigationBack = function(){
    native.navigation.navigateBack();
  }
  
  //Native Show Modal
  window.nativeShowModal = function(){
    native.navigation.openModal({url:'second.html',transitionStyle:'flip'});
  }
  
  //Native Close Modal
  window.nativeCloseModal = function(){
    native.navigation.closeModal();
  }
  
  //Native Show Modal
  window.nativeShowWindow = function(){
    native.navigation.openModal({url:'second.html',presentationStyle:'window'});
  }
  
  //Native Close Modal
  window.nativeCloseWindow = function(){
    native.navigation.closeModal();
  }
  
  //Native App Event
  window.addAppEvent = function(){
    _v._$addEvent(window,'appevent',function(_info){
                  native.log.write(_info);
    });
  }
  
  //Orientation Event
  window.addOrientationEvent = function(){
    _v._$addEvent(window,'nativeorientation',function(_degree){
                    native.log.write(_degree);
                  });
  }
  
  //NativeOrientationEventHandler
  window.nativeOrientationEventHandler = 
  _v._$addEvent('btnWriteLog','tap',writeLog);
  _v._$addEvent('btnGetDeviceInfo','tap',getDeviceInfo);
  _v._$addEvent('btnAlert','tap',nativeAlert);
  _v._$addEvent('btnConfirm','tap',nativeConfirm);
  _v._$addEvent('btnNavigateTo','tap',nativeNavigation);
  _v._$addEvent('btnNavigateBack','tap',nativeNavigationBack);
  _v._$addEvent('btnShowModal','tap',nativeShowModal);
  _v._$addEvent('btnCloseModal','tap',nativeCloseModal);
  _v._$addEvent('btnShowWindow','tap',nativeShowWindow);
  _v._$addEvent('btnCloseWindow','tap',nativeCloseWindow);
  _v._$addEvent('btnAppEvent','tap',addAppEvent);
  _v._$addEvent('btnOrientationEvent','tap',addOrientationEvent);
  
}
define(['{lib}hybrid/ios/log.js',
        '{lib}hybrid/ios/device.js',
        '{lib}hybrid/ios/notification.js',
        '{lib}hybrid/ios/navigation.js',
        '{lib}hybrid/ios/appevent.js',
        '{lib}hybrid/ios/orientation.js',
        '{lib}hybrid/ios/memory.js',
        '{lib}util/gesture/tap.js'
        ],f)