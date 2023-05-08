from selenium import webdriver
from selenium.webdriver.common.by import By
import time

ignition_version = "8.1.27"
base_url = "https://inductiveautomation.com/downloads/third-party-modules/%s" % ignition_version

browser = webdriver.Safari()

browser.get(base_url + ignition_version)
time.sleep(2)
modules_section = browser.find_element(By.CLASS_NAME, "strategic-partner-modules")

module_rows = modules_section.find_elements(By.CSS_SELECTOR, ".flex-row.data")

modules = []
for row in module_rows:
	module_url = row.find_element(By.XPATH, ".//a").get_attribute("href")

	# If its not a .modl file, skip it
	if not module_url.endswith(".modl"):
		continue

	module_name = row.find_element(By.XPATH, ".//a/span[1]").text

	# Find the checksum button and click it
	checksum_button = row.find_element(By.XPATH, ".//span[@class='jqtooltip tooltipstered']")
	
	checksum_button.click()
	time.sleep(0.25)
	# Find the checksum text
	checksum_text = browser.find_element(By.CLASS_NAME, "installer-sha").text

	modules.append((module_name, module_url, checksum_text))

browser.close()

arg_file_path = "module-args.txt"
with open(arg_file_path, "w") as arg_file:
	for module in modules:
		arg_file.write(f'ARG {module[0].replace(" ", "_").upper()}_DOWNLOAD_URL="{module[1]}"\n')
		arg_file.write(f'ARG {module[0].replace(" ", "_").upper()}_DOWNLOAD_SHA256="{module[2]}"\n')
	