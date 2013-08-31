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


component extends="contentbox.model.system.SettingService" accessors="true" singleton {

	//------------------------------------------------------------------------------------------------
	// Add our settings to the CB settings entity
	//------------------------------------------------------------------------------------------------
	public void function addSetting(required struct setting) {
		var asettings = [];
		var props = {name = "ga_settings", value = serializeJson(setting)};

		arrayAppend( aSettings, new(properties=props) );
		saveAll( aSettings );
	}

	//------------------------------------------------------------------------------------------------
	// get All our settings back from CB settings
	//------------------------------------------------------------------------------------------------
	public struct function getSettings() {
		var setting = findWhere({name="ga_settings"});
		return deserializeJson(setting.getValue());
	}
}
