//import QtQuick 2.0
//import QtQuick.Window 2.12
//import QtQuick.Controls 2.5

//Window {
//    id:infoWindow
//    width: 800
//    height: 600

//    function setInformation(town, info)
//    {
//        title = town
//        textEdit.text = info
//    }

//    Flickable
//    {
//        anchors.fill: parent
//        id:flick
//        TextArea.flickable: TextArea {
//             id: textEdit
//             width: flick.width
//            height: flick.height
//            readOnly: true
//            focus: true
//            wrapMode: TextEdit.Wrap
//            selectByMouse: true
//        }
//    }
//}

import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
//import QtQuick.Dialogs 1.2
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: "View tasks"



    TableView {
        id: tableView
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 5

        TableViewColumn {
            role: "ftaskName"
            title: "Task"
        }
        TableViewColumn {
            role: "ftaskEnd"
            title: "End"
        }
        TableViewColumn {
            role: "fDegree"
            title: "Degree"
        }

        model: myModel
    }

}

