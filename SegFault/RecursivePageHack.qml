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
			//text: controller.model
			text: "Hello World"
		}

		Button
		{
			text: "Stack more"
			onClicked: {
				var value = controller.model;
				console.log(value)
				value += "and World"
				console.log(value)
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

