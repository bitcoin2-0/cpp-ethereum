function(eth_apply TARGET REQUIRED )
	#if (DEFINED solidity_SOURCE_DIR)
		#set(SOL_DIR "${ethereum_SOURCE_DIR}/solidity")
		#set(ETH_SOLIDITY_LIBRARY solidity)
	#else()
		set(SOL_DIR "${CMAKE_CURRENT_LIST_DIR}/../solidity" CACHE PATH "The path to the solidity directory")
		#set(SOL_BUILD_DIR_NAME  "build"                                             CACHE STRING "The name of the build directory in solidity repo")
		#set(SOL_BUILD_DIR "${SOL_DIR}/${SOL_BUILD_DIR_NAME}")
		#set(CMAKE_LIBRARY_PATH ${SOL_BUILD_DIR};${CMAKE_LIBRARY_PATH})
	#endif()

	find_package(Solidity)

	target_include_directories(${TARGET} PUBLIC ${SOLIDITY_INCLUDE_DIRS})

	message("Using Solidity library: ${SOLIDITY_LIBRARIES}")

	eth_use(${TARGET} Eth::devcore Eth::evmasm)
	target_compile_definitions(${TARGET} PUBLIC ETH_SOLIDITY)
	target_link_libraries(${TARGET} ${SOLIDITY_LIBRARIES})
endfunction()
