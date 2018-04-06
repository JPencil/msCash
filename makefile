PRJ = TLV
VER = 1.0
SHO = lib$(PRJ).so
OUT = $(SHO).$(VER)

#WRKSPC = /home/backbox/Developer/JDP
WRKSPC = /Users/admin/Developer/SCM/JDP
PRJDIR = $(WRKSPC)/$(PRJ)
INCDIR = $(PRJDIR)/inc
SRCDIR = $(PRJDIR)/src
OBJDIR = $(PRJDIR)/obj
OUTDIR = $(PRJDIR)/out
LIBDIR = $(WRKSPC)/LIB

SRCFLS = $(wildcard $(SRCDIR)/*.cpp)
OBJFLS = $(patsubst $(SRCDIR)/%.cpp, $(OBJDIR)/%.o, $(SRCFLS))
INCLUD = -I$(INCDIR)

MD = mkdir
RM = rm
LN = ln -s
CC = g++

SOFLAGS = -Wall -fPIC -c
SHFLAGS = -shared 

$(SHO): $(LIBDIR) $(OUT) 
	$(LN) $(OUTDIR)/$(OUT) $(LIBDIR)/$(SHO)

$(OUT): $(OBJDIR) $(OUTDIR) $(OBJFLS)
	$(CC) $(SHFLAGS) $(OBJFLS) -o $(OUTDIR)/$(OUT)

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	$(CC) $(INCLUD) $(SOFLAGS) $< -o $@

$(OBJDIR):
	$(MD) $(OBJDIR)

$(OUTDIR):
	$(MD) $(OUTDIR)

$(LIBDIR):
	$(MD) $(LIBDIR)

clean:
	$(RM) -rf $(OBJDIR) $(OUTDIR) $(LIBDIR)/$(SHO)
	
