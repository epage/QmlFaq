import QtQuick 1.0
import com.nokia.meego 1.0

PageStackWindow
{
	id: stackWindow

	initialPage: Page
	{
		id: pageId

		onStatusChanged: {
			if(pageId.status === PageStatus.Active)
			{
				controller.load_settings()
			}
		}

		Connections
		{
			target: controller
			onSettingsLoaded: {
				controller.load_backend();
			}
			onBackendLoaded: {
				pageStack.replace(Qt.resolvedUrl("Done.qml"))
			}
		}

		Text
		{
			text: "Loading"
			width: parent.width
			anchors.top: parent.top
		}
	}
}

