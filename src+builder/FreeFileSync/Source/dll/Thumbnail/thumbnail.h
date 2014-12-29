// **************************************************************************
// * Copyright (C) 2014 abcdec @GitHub - All Rights Reserved                *
// * This file is part of a modified version of FreeFileSync, MinFFS.       *
// * The original FreeFileSync program and source code are distributed by   *
// * the FreeFileSync project: http://www.freefilesync.org/                 *
// * This particular file is created by by abcdec @GitHub as part of the    *
// * MinFFS project: https://github.com/abcdec/MinFFS                       *
// *                          --EXPERIMENTAL--                              *
// * This program is experimental and not recommended for general use.      *
// * Please consider using the original FreeFileSync program unless there   *
// * are specific needs to use this experimental MinFFS version.            *
// *                          --EXPERIMENTAL--                              *
// * This file is distributed under GNU General Public License:             *
// * http://www.gnu.org/licenses/gpl-3.0 per the FreeFileSync License.      *
// * This modified program is distributed in the hope that it will be       *
// * useful, but WITHOUT ANY WARRANTY; without even the implied warranty of *
// * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU       *
// * General Public License for more details.                               *
// **************************************************************************

#ifndef DLL_THUMBNAIL_THUMBNAIL_H_INCLUDED
#define DLL_THUMBNAIL_THUMBNAIL_H_INCLUDED
// The original FreeFileSync source distribution does not come with this
// file, although it appeared this file is required to build properly.
// Thus it was recreated from its usage context.

#include <string>
#include "zen/dll.h"

namespace thumb {

    struct ImageData {
    public:
	int width;
	int height;
//	std::string rgb;
//	std::string alpha;
	unsigned char *rgb;
	unsigned char *alpha;
    };
    
    typedef enum {
	ICON_SIZE_16,
	ICON_SIZE_32,
	ICON_SIZE_48,
	ICON_SIZE_128
    } IconSizeType;

    typedef wxImage (*FunType_getIconByIndex)(size_t userIndex);
    typedef wxImage (*FunType_getThumbnail)(size_t userIndex);
    typedef void (*FunType_releaseImageData)(ImageData *ptrIn);

    const std::string funName_getIconByIndex = "getIconByIndex";
    const std::string funName_getThumbnail = "getThumbnail";
    const std::string funName_releaseImageData = "releaseImageData";

    inline std::wstring getDllName() {
	return L"Thumbnail_Win32.dll";
	//return L"Thumbnail_x64.dll";
    };

}

#endif//DLL_THUMBNAIL_THUMBNAIL_H_INCLUDED
