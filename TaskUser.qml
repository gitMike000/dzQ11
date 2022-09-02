import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Rectangle {
    property  string taskname: ""
    property  string deadline: ""
    property  string progress: ""

//    property int nTasks: 0

    function setValue(t, inf)
    {
        console.log(t + inf)
    }

    id: comps
    color: '#eeeee4'
    width: 500
    height: 150

    ScrollView {
        id:scroll

        RowLayout {

        Text {
            id:name
            text: 'task ' + taskname
        }

        Text {
            id: dead
            text: 'deadline ' + deadline
        }

        Text {
            id: prog
            text: 'progress ' + progress
        }

      }

    }

    Component.onCompleted: {
        name.y = 0;
        name.x = 0;

        dead.y = 0;
        dead.x = parent.width/3;

        prog.y = 0;
        prog.x = 2*parent.width/3;
    }
}
