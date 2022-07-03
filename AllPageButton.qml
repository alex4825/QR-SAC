import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.2


Button{
    property string name: "Name of a button"
    id: button
    text: name
    font.pointSize: 20
    background: Rectangle {
        implicitWidth: window.width/2 + 50
        color: button.down ? color.darker(1.5) : "#34C924"
    }
}
