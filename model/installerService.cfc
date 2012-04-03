/********************************************************************************
GoogleAnalytics - A module to provide Google Anayltics to your pages
Copyright 2012 by Andrew Scott
********************************************************************************
Apache License, Version 2.0

Copyright Since [2012] [Andrew Scott]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
********************************************************************************/


component accessors="true" {

	property name="settingService" inject="settingService@ga";

	//------------------------------------------------------------------------------------------------
	// Constructor
	//------------------------------------------------------------------------------------------------
	public InstallerService function init() {
		return this;
	}

	//------------------------------------------------------------------------------------------------
	// Our entry point for our installation
	//------------------------------------------------------------------------------------------------
	public void function execute() transactional {
		if(!isReady()) {
			createSettings();
		}
	}

	//------------------------------------------------------------------------------------------------
	// Check to see if we have not already saved the settings, so that it is not duplicated.
	//------------------------------------------------------------------------------------------------
	public boolean function isReady() {
		var setting = settingService.findWhere({name="ga_settings"});
		if(isNUll(setting)) {
			return false;
		} else {
			return true;
		}
	}

	//------------------------------------------------------------------------------------------------
	// Create settings for Syntax Highlighter and add them to the CB settings
	//------------------------------------------------------------------------------------------------
	public void function createSettings() {
		var setting = {
			trackingId = ""
		};
		settingService.addSetting(setting);
	}
}
