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


component{

	property name="settingService" inject="id:settingService@ga";

	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	public function preHandler(event, action, eventArguments) {
		var rc 	= event.getCollection();
		var prc = event.getCollection(private = true);
		prc.gaSettings = settingService.getSettings(asStruct = true);
	}

	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	public void function index(event,rc,prc){
		prc.tabModules_googleAnalytics = true;
		event.setView("settings/index");
	}

	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	public function saveSettings(event, rc, prc) {
		// Probably should not be here, and should be in the service but its here for now.
		for(var count = 1; count <= listLen(rc.fieldnames); count++) {
			prc.gaSettings[listGetAt(rc.fieldnames, count)] = rc[listGetAt(rc.fieldnames, count)];
		}

		var props = {ga_settings = serializeJson(prc.gaSettings)};
		settingService.bulkSave(props);
		setNextEvent('cbadmin.module.GoogleAnalytics.settings');
	}
}