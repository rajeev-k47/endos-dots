import QtQuick
import Quickshell
import Quickshell.Wayland

import qs.modules.common
import qs.modules.ii.background
import qs.modules.ii.bar
import qs.modules.ii.cheatsheet
import qs.modules.ii.dock
import qs.modules.ii.lock
import qs.modules.ii.mediaControls
import qs.modules.ii.notificationPopup
import qs.modules.ii.onScreenDisplay
import qs.modules.ii.onScreenKeyboard
import qs.modules.ii.overview
import qs.modules.ii.polkit
import qs.modules.ii.regionSelector
import qs.modules.ii.screenCorners
import qs.modules.ii.screenTranslator
import qs.modules.ii.sessionScreen
import qs.modules.ii.sidebarLeft
import qs.modules.ii.sidebarRight
import qs.modules.ii.overlay
import qs.modules.ii.verticalBar
import qs.modules.ii.wallpaperSelector

Scope {
    PanelLoader { extraCondition: !Config.options.bar.vertical; component: Bar {} }
    PanelLoader { component: Background {} }
    PanelLoader { component: Cheatsheet {} }
    PanelLoader { extraCondition: Config.options.dock.enable; component: Dock {} }
    PanelLoader { component: Lock {} }
    PanelLoader { component: MediaControls {} }
    PanelLoader { component: NotificationPopup {} }
    PanelLoader { component: OnScreenDisplay {} }
    PanelLoader { component: OnScreenKeyboard {} }
    PanelLoader { component: Overlay {} }
    PanelLoader { component: Overview {} }
    PanelLoader { component: Polkit {} }
    PanelLoader { component: RegionSelector {} }
    PanelLoader { component: ScreenCorners {} }
    PanelLoader { component: ScreenTranslator {} }
    PanelLoader { component: SessionScreen {} }
    PanelLoader { component: SidebarLeft {} }
    PanelLoader { component: SidebarRight {} }
    PanelLoader { extraCondition: Config.options.bar.vertical; component: VerticalBar {} }
    PanelLoader { component: WallpaperSelector {} }

    component Watermark: PanelWindow {
        screen: Quickshell.primaryScreen
        WlrLayershell.layer: WlrLayer.Overlay
        WlrLayershell.namespace: "quickshell:watermark"
        exclusionMode: ExclusionMode.Ignore
        color: "transparent"
        anchors {
            bottom: true
            right: true
        }
        margins {
            bottom: 50
            right: 20
        }
        implicitWidth: 350
        implicitHeight: 90

        Column {
            anchors.centerIn: parent
            spacing: 4

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Activate Linux"
                color: "#99ffffff"
                font {
                    pixelSize: 24
                    weight: Font.Normal
                }
                style: Text.Sunken
                styleColor: "#40000000"
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Go to Settings to activate Linux"
                color: "#70ffffff"
                font {
                    pixelSize: 13
                    weight: Font.Light
                }
                style: Text.Sunken
                styleColor: "#30000000"
            }
        }

        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.NoButton
        }
    }

    Watermark {}
}
