#include <verilatedos.h>
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <time.h>
#include <sys/types.h>
#include <signal.h>
#include "verilated.h"
#include "Vpattern.h"
#include "testb.h"

int	main(int argc, char **argv) {
	Verilated::commandArgs(argc, argv);
	TESTB<Vpattern>	*tb
		= new TESTB<Vpattern>;

	tb->opentrace("pattern.vcd");
	int oldpixclk=0;

	printf("P3\n640 480\n255\n");

	for (unsigned clocks=0; clocks < 4400000; clocks++) {
		tb->tick();
		if (tb->m_core->i_pixclk &&
				(tb->m_core->i_pixclk != oldpixclk)) {
		  if (tb->m_core->o_rd) {
#if 1
		    printf("%d %d %d\n",
			tb->m_core->red,
			tb->m_core->grn,
			tb->m_core->blu);
		  }
#else
                    printf("%x %x %x => %x %x %x\n",
                        tb->m_core->red,
                        tb->m_core->grn,
                        tb->m_core->blu,
                        tb->m_core->o_TMDS_red,
                        tb->m_core->o_TMDS_grn,
                        tb->m_core->o_TMDS_blu);
                  }
#endif
		}
		oldpixclk= tb->m_core->i_pixclk;
	}
}
