import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.2
import QtQuick.LocalStorage 2.15

Page {
    id: menuNewAccount
    anchors.fill: window.contentItem
    signal createAccountClicked();
    readonly property string passwordDB: fieldPass.text



    header: AllPageHeader {
        title: "Log in to your account"
    }

    Rectangle {
        anchors.top: header.bottom
        width: parent.width
        height: parent.height - header.height

        Column {
            spacing: parent.height/8
            anchors.centerIn: parent

            TextField {
                id: fieldPass
                placeholderText: "Enter the password..."
                echoMode: TextField.Password
                wrapMode: TextField.WordWrap
                font.pointSize: 18
                background: Rectangle {
                    implicitWidth: window.width/2 + 50
                    border.color: "#34C924"
                    border.width: 2
                }
            }

            AllPageButton {
                name: "Login"
                onClicked: {
                    if(fieldPass.length >= 5) {
                        menuNewAccount.createAccountClicked();
                        textError.visible = false;
                    }
                    else {
                        textError.visible = true;
                    }
                }
            }


        }
    }
    footer: Rectangle {
        id: footer
        anchors.bottom: parent.bottom
        width: parent.width
        height: parent.height/8

        Text {
            id: textError
            text: "Enter a password of at least 5 characters long"
            color: "red"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.centerIn: parent
            wrapMode: Text.WordWrap
            font.pointSize: 15
            visible: false
        }

    }

    Keys.onBackPressed: {
        popPage();
    }
}
