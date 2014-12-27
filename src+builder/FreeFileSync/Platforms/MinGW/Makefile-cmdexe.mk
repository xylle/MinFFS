# // **************************************************************************
# // * Copyright (C) 2014 abcdec @GitHub - All Rights Reserved                *
# // * This file is part of a modified version of FreeFileSync, MinFFS.       *
# // * The original FreeFileSync program and source code are distributed by   *
# // * the FreeFileSync project: http://www.freefilesync.org/                 *
# // * This particular file is created by by abcdec @GitHub as part of the    *
# // * MinFFS project: https://github.com/abcdec/MinFFS                       *
# // *                          --EXPERIMENTAL--                              *
# // * This program is experimental and not recommended for general use.      *
# // * Please consider using the original FreeFileSync program unless there   *
# // * are specific needs to use this experimental MinFFS version.            *
# // *                          --EXPERIMENTAL--                              *
# // * This file is distributed under GNU General Public License:             *
# // * http://www.gnu.org/licenses/gpl-3.0 per the FreeFileSync License.      *
# // * This modified program is distributed in the hope that it will be       *
# // * useful, but WITHOUT ANY WARRANTY; without even the implied warranty of *
# // * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU       *
# // * General Public License for more details.                               *
# // **************************************************************************

APPNAME     := FreeFileSyncMod.exe

PROJECT_TOP := ../../..
MINGW_ROOT  := C:/MinGW
WXWGT_ROOT  := C:/wxWidgets
BOOST_ROOT  := C:/Boost
BOOST_VER   := 1_54

  # wxWidgets wx-config --cxxflags
CXXFLAGS := -mthreads
CXXFLAGS += -DHAVE_W32API_H
CXXFLAGS += -D__WXMSW__
CXXFLAGS += -D__WXDEBUG__
CXXFLAGS += -D_UNICODE
CXXFLAGS += -IC:\wxWidgets\lib\gcc_lib\mswu
CXXFLAGS += -IC:\wxWidgets\include
CXXFLAGS += -Wno-ctor-dtor-privacy
CXXFLAGS += -pipe
CXXFLAGS += -fmessage-length=0
CXXFLAGS += -Wl,--subsystem,windows
CXXFLAGS += -mwindows
CXXFLAGS += -Wl,--enable-auto-import

  # FreeFileSync
CXXFLAGS += -DZEN_WIN
CXXFLAGS += -std=c++11
CXXFLAGS += -DWXINTL_NO_GETTEXT_MACRO
CXXFLAGS += -Wall
CXXFLAGS += -O3

  # MinFFS Specific
  # WINVER: MinGW is still supporting older version of windows but
  # FreeFileSync supports from Windows 2000 (OS ver 5.0) and onward.
  # Need to adjust WINVER to successfully compile.
CXXFLAGS += -DWINVER=0x0500
CXXFLAGS += -DMinFFS

  # UNICODE, _UNICODE: For some reason to make the MinGW compiliation
  # work properly, need to define both UNICODE and _UNICODE.
CXXFLAGS += -DUNICODE
CXXFLAGS += -I$(PROJECT_TOP)/FreeFileSync/Source
CXXFLAGS += -I$(PROJECT_TOP)
CXXFLAGS += -I$(PROJECT_TOP)/zenXml
CXXFLAGS += -I$(PROJECT_TOP)/FreeFileSync/Platforms/MinGW
CXXFLAGS += -include "zen/i18n.h"
CXXFLAGS += -include "zen/warn_static.h"
CXXFLAGS += -I$(WXWGT_ROOT)/include
CXXFLAGS += -I$(WXWGT_ROOT)/lib/gcc_lib/mswud
CXXFLAGS += -I$(BOOST_ROOT)/include/boost-$(BOOST_VER)

LINKFLAGS := -L$(BOOST_ROOT)/lib
LINKFLAGS += -lboost_system-mgw46-mt-$(BOOST_VER)
LINKFLAGS += -lboost_thread-mgw46-mt-$(BOOST_VER)

  # wxWidgets wx-config --libs
LINKFLAGS += -mthreads
LINKFLAGS += -LC:/wxWidgets/lib/gcc_lib
LINKFLAGS += -lwxmsw30ud_xrc
LINKFLAGS += -lwxmsw30ud_aui
LINKFLAGS += -lwxmsw30ud_html
LINKFLAGS += -lwxmsw30ud_adv
LINKFLAGS += -lwxmsw30ud_core
LINKFLAGS += -lwxbase30ud_xml
LINKFLAGS += -lwxbase30ud_net
LINKFLAGS += -lwxbase30ud
LINKFLAGS += -lwxtiffd
LINKFLAGS += -lwxjpegd
LINKFLAGS += -lwxpngd
LINKFLAGS += -lwxzlibd
LINKFLAGS += -lwxregexud
LINKFLAGS += -lwxexpatd
LINKFLAGS += -lkernel32
LINKFLAGS += -luser32
LINKFLAGS += -lgdi32
LINKFLAGS += -lcomdlg32
LINKFLAGS += -lwinspool
LINKFLAGS += -lwinmm
LINKFLAGS += -lshell32
LINKFLAGS += -lcomctl32
LINKFLAGS += -lole32
LINKFLAGS += -loleaut32
LINKFLAGS += -luuid
LINKFLAGS += -lrpcrt4
LINKFLAGS += -ladvapi32
LINKFLAGS += -lwsock32
LINKFLAGS += -lmpr

CXX := g++

# Deebug control
CXXFLAGS += -DNDEBUG
CXXFLAGS += -g
#LINKFLAGS += -s

CPP_LIST=
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/application.cpp              #OK
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/algorithm.cpp                #OK
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/comparison.cpp               #!!!!!!!!! CULPRIT   // unmodified but dir_exist_async.h update was needed
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/structures.cpp               #OK
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/synchronization.cpp          #!!!!!!!!! CULPRIT   // unmodified but dir_exist_async.h update was needed
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/file_hierarchy.cpp           #OK
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/ui/custom_grid.cpp           #OK
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/ui/folder_history_box.cpp    #OK
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/ui/on_completion_box.cpp     #OK
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/ui/dir_name.cpp              #!!!!!!!!! CULPRIT  // extensively modified to link!!!! #ifdef out async call
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/ui/batch_config.cpp          #OK
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/ui/batch_status_handler.cpp  #OK
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/ui/check_version.cpp         #OK
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/ui/grid_view.cpp             #OK
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/ui/tree_view.cpp             #OK
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/ui/gui_generated.cpp         #OK
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/ui/gui_status_handler.cpp    #!!!!!!!!! CULPRIT  // modified to link!!!! // #ifdef out boost sleep
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/ui/main_dlg.cpp              #!!!!!!!!! CULPRIT  // modified to link!!!! // #ifdef out boost async GetFirst... etc.
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/ui/progress_indicator.cpp    #!!!!!!!!! CULPRIT  // modified to link!!!! // #ifdef out boost sleep
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/ui/search.cpp                #OK
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/ui/small_dlgs.cpp            #OK
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/ui/sync_cfg.cpp              #OK
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/ui/taskbar.cpp               #OK
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/ui/triple_splitter.cpp       #OK
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/ui/tray_icon.cpp             #OK
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/lib/binary.cpp               #!!!!!!!!! CULPRIT  // modified to link!!!! // zen::filesHaveSameContent faked out. need to rewrite.
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/lib/db_file.cpp              #OK
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/lib/dir_lock.cpp             #!!!!!!!!! CULPRIT  // modified to link!!!! // #ifdef out boost thread...
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/lib/hard_filter.cpp          #OK
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/lib/icon_buffer.cpp          #!!!!!!!!! CULPRIT  // modified to link!!!! // #ifdef out boost thread...
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/lib/localization.cpp         #OK
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/lib/parallel_scan.cpp        #!!!!!!!!! CULPRIT  // modified to link!!!! // #ifdef out boost thread...
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/lib/process_xml.cpp          #OK
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/lib/resolve_path.cpp         #!!!!!!!!! CULPRIT  // modified to link!!!! // Thread addJob() template related
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/lib/perf_check.cpp           #OK
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/lib/status_handler.cpp       #OK
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/lib/versioning.cpp           #OK
CPP_LIST+=$(PROJECT_TOP)/FreeFileSync/Source/lib/ffs_paths.cpp            #OK
CPP_LIST+=$(PROJECT_TOP)/zen/xml_io.cpp                                   #OK
CPP_LIST+=$(PROJECT_TOP)/zen/recycler.cpp                                 #!!!!!!!!! CULPRIT  // modified to link!!!! // #ifdef out boost async
CPP_LIST+=$(PROJECT_TOP)/zen/file_access.cpp                              #OK
CPP_LIST+=$(PROJECT_TOP)/zen/file_io.cpp                                  #OK
CPP_LIST+=$(PROJECT_TOP)/zen/file_traverser.cpp                           #OK
CPP_LIST+=$(PROJECT_TOP)/zen/zstring.cpp                                  #OK
CPP_LIST+=$(PROJECT_TOP)/zen/format_unit.cpp                              #OK
CPP_LIST+=$(PROJECT_TOP)/zen/process_priority.cpp                         #OK
CPP_LIST+=$(PROJECT_TOP)/wx+/grid.cpp                                     #OK
CPP_LIST+=$(PROJECT_TOP)/wx+/image_tools.cpp                              #OK
CPP_LIST+=$(PROJECT_TOP)/wx+/graph.cpp                                    #OK
CPP_LIST+=$(PROJECT_TOP)/wx+/tooltip.cpp                                  #OK
CPP_LIST+=$(PROJECT_TOP)/wx+/image_resources.cpp                          #OK
CPP_LIST+=$(PROJECT_TOP)/wx+/popup_dlg.cpp                                #OK
CPP_LIST+=$(PROJECT_TOP)/wx+/popup_dlg_generated.cpp                      #OK
CPP_LIST+=$(PROJECT_TOP)/wx+/zlib_wrap.cpp                                #OK

OBJECT_LIST = $(CPP_LIST:%.cpp=%.o)


all: FreeFileSync

.cpp.o:
	$(CXX) $(CXXFLAGS) -c $< -o $@


FreeFileSync:	$(APPNAME)

$(APPNAME):	$(OBJECT_LIST)
	$(CXX) -o $(APPNAME) $(OBJECT_LIST) $(LINKFLAGS)

#TODO for native cmd.exe+MinGW build
#clean:
#	del $(APPNAME) $(OBJECT_LIST)
#

#
#install:
#	mkdir -p $(BINDIR)
#	cp Build/$(APPNAME) $(BINDIR)
#
#	mkdir -p $(APPSHAREDIR)
#	cp -R ../Build/Languages/ \
#	../Build/Help/ \
#	../Build/Sync_Complete.wav \
#	../Build/Resources.zip \
#	../Build/styles.gtk_rc \
#	$(APPSHAREDIR)
#	mkdir -p $(DOCSHAREDIR)
#	cp ../Build/Changelog.txt $(DOCSHAREDIR)/changelog
#	gzip $(DOCSHAREDIR)/changelog

# TODO_MinFFS DEBUGGING ONLY TO BE REMOVED Begin

#filecheck:
#	@echo TODO files
#	@grep -l TODO_MinFFS $(CPP_LIST)
#	@echo
#	@echo List of Object files compiled
#	@ls -1 $(OBJECT_LIST)

sanity.exe: sanity.o
	$(CXX) -o sanity.exe sanity.o $(LINKFLAGS)

#cleansanity:
#	rm -rf sanity.exe sanity.o

# TODO_MinFFS DEBUGGING ONLY TO BE REMOVED End
