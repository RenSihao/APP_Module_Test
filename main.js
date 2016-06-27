console.log("main.js run success !")

//js代码
defineClass('RootVC', {
            
            
            
            tableView_didSelectRowAtIndexPath: function(tableView, indexPath) {
            
            console.log('JS点击cell输出嘻嘻')
            
            },
            
            
            viewDidLoad: function() {
            
            self.super().viewDidLoad();
            
            self.valueForKey('view').addSubview(self.valueForKey('tableView'));
            
            self.setTitle('JS脚本改名嘻嘻');
            
            require('UIColor');
            
            self.tableView().setBackgroundColor(UIColor.redColor());
            
//            self.valueForKey('tableView').setBackgroundColor(UIColor.blueColor());
            
            }
//
////            var alertView = require('UIAlertView').alloc().init();
////            alertView.setTitle('Alert');
////            alertView.setMessage('AlertView from js');
////            alertView.addButtonWithTitle('OK');
////            alertView.show();
//            
//            },
//            
//            viewWillAppear: function(animated) {
//            self.super().viewWillAppear(animated);
//            
//            },
//            
//            viewWillDisappear: function(animated) {
//            self.super().viewWillDisappear(animated);
//            
//            },
            
            
            });