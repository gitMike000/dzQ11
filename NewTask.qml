import QtQuick 2.15
import QtQuick.Controls 2.15

import QtQuick.Window 2.15
import QtQuick.Layouts 1.15

Rectangle {
    color: '#10ee20'
    width: 500
    height: 300
    id:mainrect

//==
    Text {
        x:10
        y:10
        text: qsTr("Task")
    }

    Rectangle {
        color: 'white'
        x:taskName.x
        y:taskName.y
        width: taskName.width
        height: taskName.height
    }

    TextEdit {
        id:taskName
        y:10
        x:100
        width: 400
        focus: true
        height: 25
    }
//==
    Text {
        x:10
        y: endtask.y
        text: qsTr("Deadline")
    }

    Rectangle {
        color: 'white'
        x:endtask.x
        y:endtask.y
        width: endtask.width
        height: endtask.height
    }

    TextEdit {
        id:endtask
        y:40
        x:100
        width: 400
        focus: true
        height: 25
    }

//==
    Text {
        x: 10
        y: progress.y
        text: qsTr("Progress")
    }

    Text {
        x: 10
        y: progress.y+30
        text: 'All tasks ' + nTasks
    }


    Text {
        x: 10
        y: progress.y+60
        color: 'red'
        text: bV
    }

    Rectangle {
        color: 'white'
        x:progress.x
        y:progress.y
        width: progress.width
        height: progress.height
    }

    TextEdit {
        id:progress
        y:70
        x:100
        width: 400
        focus: true
        height: 25
    }

//==

//    Flickable {
//        id:flick
//        x:100
//        y:40
//        width: 400
//        height: 80
//        ScrollBar.vertical: ScrollBar{}
//        TextArea.flickable: TextArea {
//            id:endtask
//            width: flick.width
//            height: flick.height
//            focus: true
//            wrapMode: TextEdit.Wrap
//            selectByMouse: true
//        }
//    }

//    Button {
//        id:addData
//        text: qsTr("Add")
//        onClicked:
//        {
//            var task = taskName.text
//            var end = endtask.text
//            var prg = progress.text
//            mainrect.parent.add(task, end, prg)
//        }
//        Component.onCompleted: {
//            x = mainrect.width - 100;
//            y = mainrect.height - 30;
//            width=100
//            height=30
//        }
//    }

    Mybutton {
        id:addData
//        text: qsTr("Add")
        img: "qrc:///Mybutton.png"

        onClickedChanged:
        {
            var task = taskName.text
            var end = endtask.text
            var prg = progress.text
            mainrect.parent.add(task, end, prg)
        }

        Component.onCompleted: {
            x = mainrect.width - 200;
            y = mainrect.height - 30;
            width=100
            height=30
        }
    }

    Mybutton {
        id:tasksButton
//        text: qsTr("Add")
        img: "qrc:///tasks.png"

        onClickedChanged:
        {
              var vcomp = Qt.createComponent("ViewTasks.qml")
              var objV = vcomp.createObject(ViewTasks)
              console.log(objV)
              myModel.updateModel()
              objV.show()

        }

        Component.onCompleted: {
            x = mainrect.width - 100;
            y = mainrect.height - 30;
            width=100
            height=30
        }
    }
}
