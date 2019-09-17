/*
 *  Intel provides this code “as-is” and disclaims all express and implied warranties, including without 
 *  limitation, the implied warranties of merchantability, fitness for a particular purpose, and non-infringement, 
 *  as well as any warranty arising from course of performance, course of dealing, or usage in trade. No license 
 *  (express or implied, by estoppel or otherwise) to any intellectual property rights is granted by Intel providing 
 *  this code.
 *  This code is preliminary, may contain errors and is subject to change without notice. 
 *  Intel technologies' features and benefits depend on system configuration and may require enabled hardware, 
 *  software or service activation. Performance varies depending on system configuration.  Any differences in your 
 *  system hardware, software or configuration may affect your actual performance.  No product or component can be 
 *  absolutely secure.
 *  Intel and the Intel logo are trademarks of Intel Corporation in the United States and other countries. 
 *  *Other names and brands may be claimed as the property of others.
 *  © Intel Corporation
 */

//
//  Licensed under the GPL v2
//

//
//  dllmain.cpp : Defines the entry point for the DLL application.
//

#include "stdafx.h"

BOOL APIENTRY DllMain(HMODULE hModule, DWORD dwReason, LPVOID lpReserved)
{
	switch (dwReason)
	{
		case DLL_PROCESS_ATTACH:
		case DLL_THREAD_ATTACH:
		case DLL_THREAD_DETACH:
		case DLL_PROCESS_DETACH:
			break;
	}

	return TRUE;
}
