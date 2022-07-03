import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.2
import QtQuick.Dialogs 1.2

Page {
    id: menuMigration
    anchors.fill: window.contentItem

    header: AllPageHeader {
        title: "Migration"
    }

    Rectangle {
        anchors.top: header.bottom
        width: parent.width
        height: parent.height - header.height

        Column {
            spacing: parent.height/8
            anchors.centerIn: parent

            Label {
                id: textSelect
                text: "If you already have an account, then select the DB file"
                width: window.width/2 + 50
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 15
            }

            AllPageButton {
                name: "Select"
                onClicked: {
                    fileDialog.open()
                }
            }

            FileDialog {
                id: fileDialog
                    title: "Please choose a file"
                    folder: shortcuts.home
                    nameFilters: [ "All files (*)" ]

                    onAccepted: {
                        console.log("You chose: " + fileDialog.currentFile)
                        textSelected.text = fileDialog.currentFile
                    }
                    onRejected: {
                        console.log("File selection canceled")
                        textSelected.text = "No file selected"
                    }
            }

            TextField {
                id: textSelected
                text: "No file selected"
                font.pointSize: 15
                implicitWidth: window.width/2 + 50
                readOnly: true
                background: Rectangle {
                    implicitWidth: window.width/2 + 50
                    border.color: "#34C924"
                    border.width: 2
                }
            }

            TextField {
                id: fieldPass
                placeholderText: "Password of database"
                echoMode: TextField.Password
                wrapMode: TextField.WordWrap
                font.pointSize: 15
                background: Rectangle {
                    implicitWidth: window.width/2 + 50
                    border.color: "#34C924"
                    border.width: 2
                }
            }

            AllPageButton {
                name: "Migrate"
                onClicked: {

                }
            }
         }

        Keys.onBackPressed: {
            popPage();
        }
    }
}
