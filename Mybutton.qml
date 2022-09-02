import QtQuick 2.15


BorderImage {
    property alias text: _txt.text
    property alias img: anyButton.source
    property bool clicked

    id: anyButton
    //source: file
    width: 50; height: 20
    border.left: 2; border.top: 2
    border.right: 2; border.bottom: 2

//    property string image:"\ue43f"
//    property string text:"Button"

//    border.color : "black"
//    border.width: 1
//    radius: 5
Rectangle{
//    Gradient {
//        id: lightGradient
//        GradientStop { position: 0.0; color: Qt.red }
//        GradientStop { position: 1.0; color: Qt.green }
//    }

//    Gradient {
//        id: darkGradient
//        GradientStop { position: 0.0; color: Qt.blue }
//        GradientStop { position: 1.0; color: Qt.yellow }
//    }

        //anchors.horizontalCenter: parent.horizontalCenter
        //anchors.verticalCenter: parent.verticalCenter

        Text{
            id: _txt
            font.pixelSize:20
        }
    }


    MouseArea{
        id: buttonMouseArea
        anchors.fill: parent
        onClicked: parent.clickedChanged()
        onPressed: { }
        onReleased: { }
        hoverEnabled: true
    }

}
