var f=function(){
  var _  = NEJ.P,
      _v = _('nej.v'),
      _j = _('nej.j');
  window.reloadlistFunction = function(){
    var _script = document.createElement('SCRIPT');
    _script.src = 'data.js';
    _v._$addEvent(_script,'load',reloadDataHandler);
    document.body.appendChild(_script);
  }
  window.reloadDataHandler = function(){
    native.pullrefresh.finishedLoading();
    var ulElement = document.getElementById('list'),dataStr;
    var count = ulElement.children.length;
    for(var i=count+1;i<count+4;i++){
      dataStr='';
      for(var j=0;j<10;j++){
        dataStr += (i%10)+'';
      }
      ulElement.insertAdjacentHTML('afterBegin','<li>'+dataStr+'</li>');
    }
  }
  _v._$addEvent(window,'reloadlist',reloadlistFunction);
}
define(['{lib}hybrid/ios/log.js',
        '{lib}hybrid/ios/device.js',
        '{lib}hybrid/ios/notification.js',
        '{lib}hybrid/ios/navigation.js',
        '{lib}hybrid/ios/appevent.js',
        '{lib}hybrid/ios/orientation.js',
        '{lib}hybrid/ios/pullrefresh.js',
        '{lib}util/gesture/tap.js'
        ],f)