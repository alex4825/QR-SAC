import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.2

Page {    
    id: menuLogin
    anchors.fill: window.contentItem
    signal authorizationClicked();
    signal migrationClicked();

    header: AllPageHeader {
        title: "Authorization"
        isVisibleBack: false
    }

    Rectangle {
        anchors.top: header.bottom
        width: parent.width
        height: parent.height - header.height


        Column {
            spacing: parent.height/8
            anchors.centerIn: parent

            AllPageButton {
                name: "Login"
                onClicked: {
                   menuLogin.authorizationClicked();
                }
            }
            AllPageButton {
                name: "Migration"
                onClicked: {
                   menuLogin.migrationClicked();
                }
            }
            AllPageButton {
                name: "Exit"
                onClicked: {
                   Qt.quit();
                }
            }

        }
    }
}
