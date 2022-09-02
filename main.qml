import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import com.xx.boxer 1.0

Window {
    id: root

    width: 640
    height: 480
    visible: true
    title: qsTr("Boxer")


    property string sc: 'TaskUser{width:600; height:30;'

    property string nc: 'NewTask{width:600; height:150;}'
    property int num: 0
    property NewTask newTask: value

    property string bV: value
    property int nTasks: 0

     function toDate(dmy) {
      var d = dmy.split(/[\/\-\.]/, 3);

      if (d.length != 3) return null;

      // Check if date is valid
      var mon = parseInt(d[1]),
          day = parseInt(d[0]),
          year= parseInt(d[2]);
      if (d[2].length == 2) year += 2000;
      if (day <= 31 && mon <= 12 && year >= 2015)
        return new Date(year, mon - 1, day);

      return null;
    }

    function addThisDate(task, endTask, progress)
    {
        var t = toDate(endTask)
        console.log(t);
        if ((task == "") ||
            (t == null) ||
            (Math.round(progress) < 0 || Math.round(progress) > 10))
        {
            bV="Enter correct value"
            return
        }
        else {
         bV=""
         loader.saveRecord(task, endTask, progress)
         var itog = sc + 'taskname:"' + task
                      + '";deadline:"' + endTask
                      + '";progress:"' + progress + '"}'
                   //   + '";nTasks:"' + nTasks +'"}'
         var el = Qt.createQmlObject(itog, list, "obj" + num++)
         nTasks = loader.getNTasks()
        }
    }

    BoxeR {
     id : loader

     onEnd:
     {
        if (succed)
        {
            newTask = Qt.createQmlObject(nc, list, "objdata")
            loader.nextRecord()
            nTasks = loader.getNTasks()
        }
        else Qt.quit()        
     }
     onLoadTask: {
        var itog = sc + 'taskname:"' + task
                      + '";deadline:"' + endTask
                      + '";progress:"' + progress + '"}'
        var el = Qt.createQmlObject(itog, list, "obj" + num++)
            loader.nextRecord()
            nTasks = loader.getNTasks()
     }
    }

    ScrollView {
       ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
       ScrollBar.vertical.policy: ScrollBar.AlwaysOn
       anchors.fill: parent
       Component.onCompleted: loader.dbconnect()
       ColumnLayout {
           id:list
           function add(task, endTask, progress) {
               root.addThisDate(task, endTask, progress)
               console.log(task)
               console.log(endTask)
               console.log(progress)
               console.log(loader.getNTasks());
           }
       }
      }
}
