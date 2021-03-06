#include <GL/gl.h>

struct CombinerInput
{
	GLenum input;
	GLenum mapping;
	GLenum usage;
};

struct CombinerVariable
{
	GLenum input;
	GLenum mapping;
	GLenum usage;
	BOOL used;
};

struct GeneralCombiner
{
	CombinerVariable A, B, C, D;

	struct
	{
		GLenum ab;
		GLenum cd;
		GLenum sum;
	} output;
};

struct RegisterCombiners
{
	GeneralCombiner color[8];
	GeneralCombiner alpha[8];

	struct
	{
		CombinerVariable A, B, C, D, E, F, G;
	} final;

	struct 
	{
		WORD color, alpha;
	} constant[2];

	struct
	{
		WORD color, secondaryColor, alpha;
	} vertex;

	WORD numCombiners;
	BOOL usesT0, usesT1, usesNoise;
};

void Init_NV_register_combiners();
void Uninit_NV_register_combiners();
RegisterCombiners *Compile_NV_register_combiners( Combiner *color, Combiner *alpha );
void Update_NV_register_combiners_Colors( RegisterCombiners *regCombiners );
void Set_NV_register_combiners( RegisterCombiners *regCombiners );
