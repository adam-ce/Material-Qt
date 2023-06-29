import QtQuick
import QtQuick.Controls

import MMaterial

import "./Showcase"
import "./Showcase/ColorShowcase"
import "./Showcase/AvatarShowcase"
import "./Showcase/ButtonShowcase"
import "./Showcase/AlertShowcase"

Rectangle{
    color: Theme.background.main
    Item{
        id: header
        height: parent.height * 0.1
        width: parent.width

        H2{
            width: parent.width * 0.85
            anchors {
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }
            text: showcaseLoader.currentItem ? showcaseLoader.currentItem.objectName : ""
            font {
                capitalization: Font.AllUppercase
            }
        }

        Rectangle{
            height: 1
            width: parent.width
            color: Theme.other.divider
            anchors.bottom: parent.bottom
        }
    }

    StackView{
        id: showcaseLoader
        anchors{
            top: header.bottom
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        initialItem: alertShowcase
    }

    Component{ id: fontShowcase;  FontShowcase{ } }
    Component{ id: colorShowcase; ColorShowcase{ } }
    Component{ id: avatarShowcase; AvatarShowcase{ } }
    Component{ id: badgeShowcase; BadgeShowcase{ } }
    Component{ id: accordionShowcase; AccordionShowcase{ } }
    Component{ id: buttonShowcase; ButtonShowcase{ } }
    Component{ id: alertShowcase; AlertShowcase{ } }

    MButton{
        anchors{
            right: parent.right;
            top: parent.top;
            margins: Size.pixel14;
        }

        height: recommendedHeight
        width: recommendedWidth
        text: Theme.currentTheme.objectName
        onClicked: {
            if(Theme.currentTheme.objectName === "Light Theme")
                Theme.currentTheme = ThemeList.dark; //or Theme.setTheme(DarkTheme);

            else
                Theme.currentTheme = ThemeList.light; //or Theme.setTheme(LightTheme);
        }
    }
}

