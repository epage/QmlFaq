import QtQuick 1.0

import com.nokia.meego 1.0

PageStackWindow
{
	id: stackWindow
	initialPage: recursivePage

	//Component.onCompleted: {controller.push("Hello World")}

	RecursivePageHack
	{
		id: recursivePage
	}
}


