#include <verilatedos.h>
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <time.h>
#include <sys/types.h>
#include <signal.h>
#include "verilated.h"
#include "Vllhdmi.h"
#include "testb.h"

int	main(int argc, char **argv) {
	Verilated::commandArgs(argc, argv);
	TESTB<Vllhdmi>	*tb
		= new TESTB<Vllhdmi>;

	tb->opentrace("llhdmi.vcd");
	tb->m_core->i_red= 0xf0;
	tb->m_core->i_grn= 0x80;
	tb->m_core->i_blu= 0x20;
	tb->m_core->i_reset= 0;

	for (unsigned clocks=0; clocks < 4400000; clocks++) {
		tb->tick();
	}
	printf("\n\nSimulation complete\n");
}
