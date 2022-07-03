import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.2



Popup {
    id: addedWindow
    property string addedProperty: addedProperty.text
    property string addedValue: addedValue.text
    signal added();

    anchors.centerIn: parent
    padding: parent.width / 10

    Column {
        anchors.centerIn: parent
        spacing: parent.height / 8

        Label {
            text: "Property:"
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 15
        }
        TextField {
            id: addedProperty
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 15
        }
        Label {
            text: "Value:"
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 15
        }
        TextField {
            id: addedValue
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 15
        }

        AllPageButton {
            id: buttonApply
            text: "Add"
            onClicked: {
                if (addedProperty.length > 0 && addedValue.length > 0) {
                    added();
                }
            }
        }
    }
}
