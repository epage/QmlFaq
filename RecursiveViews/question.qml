import QtQuick 1.0

import com.nokia.meego 1.0

PageStackWindow
{
	id: stackWindow
	initialPage: recursivePage
	property string message: "Hello World"

	RecursivePageQuestion
	{
		id: recursivePage
	}
}


