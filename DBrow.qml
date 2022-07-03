import QtQuick 2.15
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.2

Row {
    id: dbRow
    property string cell1Text
    property string cell2Text
    property int fontSize: 15
    property color borderColor: "black"
    property int  borderWidth: 3
    property int  rectangleRadius: 5
    property color backgroundColor: "white"
    property bool isSelect: false
    signal selectCell();
    signal notSelectCell();

    anchors.margins: margin
    spacing: 5
    anchors.left: parent.left
    anchors.right: parent.right

    Rectangle {
        id: cell1
        height: 60
        width: parent.width/2 - borderWidth*2
        anchors.margins: margin
        border.color: borderColor
        border.width: borderWidth
        radius: rectangleRadius
        color: backgroundColor
        clip: true

        TextField {
            text: cell1Text
            font.pointSize: fontSize
            anchors.verticalCenter: parent.verticalCenter
            anchors.fill: parent
            anchors.margins: margin
            wrapMode: Text.WrapAnywhere
        }
    }
    Rectangle {
        id: cell2
        height: 60
        width: parent.width/2 - borderWidth*2
        anchors.margins: margin
        border.color: borderColor
        border.width: borderWidth
        radius: rectangleRadius
        color: backgroundColor
        clip: true

        TextField {
            text: cell2Text
            font.pointSize: fontSize
            anchors.verticalCenter: parent.verticalCenter
            anchors.fill: parent
            anchors.margins: margin
            wrapMode: Text.WrapAnywhere
        }
    }

    TapHandler {
        onLongPressed:
            if (dbRow.isSelect) {
                dbRow.notSelectCell();
                dbRow.isSelect = false;
            }
            else {
                dbRow.selectCell();
                dbRow.isSelect = true;
            }
    }

}



//Rectangle {
//    id: cell
//    property string cellText
//    property int fontSize: 15
//    property color borderColor: "black"
//    property int  borderWidth: 3
//    property int  rectangleRadius: 5
//    property color backgroundColor: "white"

//    signal selectCell();

//    height: 60
//    width: parent.width/2 - borderWidth*2
//    anchors.margins: margin
//    border.color: borderColor
//    border.width: borderWidth
//    radius: rectangleRadius
//    clip: true

//    TextField {
//        text: cellText
//        font.pointSize: fontSize
//        anchors.verticalCenter: parent.verticalCenter
//        anchors.fill: parent
//        anchors.margins: margin
//        wrapMode: Text.WrapAnywhere
//    }

//    TapHandler {
//        onLongPressed: {
//            cell.selectCell();
//        }
//    }

//}

