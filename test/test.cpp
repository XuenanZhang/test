#include <stdio.h>
#include <utility>
#include <string.h>
#include <string>
#include <vector>

class AA
{
public:
	void trace(int i = 0, int j = 0)
	{
		// printf("%s , %s , %s , %s", __FUNCTION__ , __TIME__ , __PRETTY_FUNCTION__, __LINE__);
		printf("filename=%s , func=%s , func=%s , line=%d , date=%s, time=%s", __FILE__ , __FUNCTION__ , __PRETTY_FUNCTION__, __LINE__, __TIME__, __DATE__);
	}
};

int main()
{

	std::vector<int> vec(6);
	for (int i = 0; i < 10; i++) {
		vec.push_back(i);
	}

	std::copy(vec.begin() + 2, vec.begin() + 6, vec.begin() + 4);
	//
	std::vector<int> vec1;
	for (int i = 0; i < 10; i++) {
		vec1.push_back(i);
	}
	memcpy( &vec1[4], &vec1[2], 4*4);
	
	return 0;
	// time_t t = time(NULL)	;
	// time_t temp = time(NULL)	;
	
	// timeval tv;
	// gettimeofday(&tv,NULL);


	// tm tm1;
	// localtime_r(&temp, &tm1 );

	// tm tm2;
	// gmtime_r(&temp, &tm2);

	// time_t tk1 = mktime(&tm1)	;
	// time_t tk2 = mktime(&tm2)	;
	// int i = 99;
}
