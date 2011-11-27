import QtQuick 1.0

import com.nokia.meego 1.0

Page
{
	id: page
	tools: viewToolbar

	Column
	{
		Text
		{
			text: controller.model
		}

		Button
		{
			text: "Stack more"
			onClicked: {
				var value = controller.model;
				console.log("Current " + value)
				value += " and World"
				console.log("New " + value)
				controller.push(value)
			}
		}
	}

	ToolBarLayout
	{
		id: viewToolbar

		ToolIcon
		{
			iconId: "toolbar-back"
			onClicked: { controller.pop() }
		}
	}
}

