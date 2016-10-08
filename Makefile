# Makefile for echo client and server

CXX=			g++ $(CCFLAGS)

ECHO-SERVER=		echo-server.o server.o message.o message-box.o client_queue.o client_object.o
ECHO-CLIENT=		echo-client.o client.o command.o
OBJS =			$(ECHO-SERVER) $(ECHO-CLIENT)

LIBS= -pthread -std=c++11

CCFLAGS= -std=c++11 -g

all:	echo-server echo-client

echo-server:$(ECHO-SERVER)
	$(CXX) -o server $(ECHO-SERVER) $(LIBS)

echo-client:$(ECHO-CLIENT)
	$(CXX) -o client $(ECHO-CLIENT) $(LIBS)

clean:
	rm -f $(OBJS) $(OBJS:.o=.d)

realclean:
	rm -f $(OBJS) $(OBJS:.o=.d) server client


# These lines ensure that dependencies are handled automatically.
%.d:	%.cc
	$(SHELL) -ec '$(CC) -M $(CCFLAGS) $< \
		| sed '\''s/\($*\)\.o[ :]*/\1.o $@ : /g'\'' > $@; \
		[ -s $@ ] || rm -f $@'

-include	$(OBJS:.o=.d)
