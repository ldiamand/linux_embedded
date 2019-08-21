#include<stdio.h>
#include<unistd.h>
#include<pthread.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
 
void *hi_prio(void *p)
{
	printf("thread1 start time=%ld\n",time(NULL));
	sleep(3);
	printf("thread1 stop time=%ld\n",time(NULL));
	return NULL;
}
 
void *low_prio(void *p)
{
	char buf[20];
	sleep(1);
	int fd=open("/dev/demo",O_RDWR);  // #mknod /dev/demo c 400 0
	puts("thread2 start");
	read(fd,buf,20);
	puts("thread2 stop");
	return NULL;
}
 
int main()
{
	pthread_t t1,t2,t3;
	
	pthread_attr_t attr;
	
	struct sched_param param;
	  
	pthread_attr_init(&attr);
	pthread_attr_setschedpolicy(&attr, SCHED_RR);
	
	param.sched_priority = 50;
	pthread_attr_setschedparam(&attr, &param);
	
	
	pthread_create(&t1,&attr,hi_prio,NULL);
	
	param.sched_priority = 30;
	pthread_attr_setschedparam(&attr, &param);
	
	pthread_create(&t2,&attr,low_prio,NULL);
	sleep(10);
	puts("end test");
	return 0;
}

