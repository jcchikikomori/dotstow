# File: /Makefile
# Project: dotstow
# File Created: 22-05-2022 06:43:47
# Author: Clay Risser
# -----
# Last Modified: 30-11-2025 13:14:00
# Modified By: John Cyrill Corsanes
# -----
# Risser Labs LLC (c) Copyright 2022
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Universal user-local install: always install to $HOME/.local/bin (or PREFIX if set), never sudo or /usr/local/bin by default
DOTSTOW_PREFIX ?= $(HOME)/.local/bin
INSTALL_DOTSTOW = $(if $(PREFIX),$(PREFIX),$(DOTSTOW_PREFIX))/dotstow

.PHONY: install uninstall help

install: $(INSTALL_DOTSTOW)

$(INSTALL_DOTSTOW): dotstow.sh
	@mkdir -p $(dir $@)
	@cp $< $@
	@chmod +x $@


uninstall:
	@rm -f $(INSTALL_DOTSTOW)

help: ;
	@echo "Usage: make [install|uninstall|help]"
	@echo ""
	@echo "  install   Install dotstow to $(INSTALL_DOTSTOW)"
	@echo "  uninstall Remove dotstow from $(INSTALL_DOTSTOW)"
	@echo "  help      Show this help message"
