import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.2



Rectangle {
    id: pageHeader
    property string title: "Header of a page"
    property bool isVisibleBack: true

    color: "#34C924"
    anchors.top: parent.top
    width: parent.width
    height: parent.height/8
    Label {
        text: title
        anchors.margins: 10
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: if(isVisibleBack) pageHeader.left
        anchors.centerIn: if(!isVisibleBack) pageHeader
        font.pointSize: 25
    }
    Button {
        id: buttonBack
        text: "Back"
        font.pointSize: 20
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        background: Rectangle {
            implicitWidth: window.width/6
            color: this.down ? color.darker(1.5) : "#34C924"
        }
        onClicked: popPage();
        visible: isVisibleBack
    }
}
