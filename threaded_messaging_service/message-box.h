#pragma once

#include <map>
#include <vector>
#include <mutex>
#include <string>
#include <sstream>
#include "message.h"

using namespace std;


class MessageBox {
public:
  MessageBox();
  ~MessageBox();

  static std::mutex m;

  std::map<string, vector<Message> >:: iterator find(string);
  std::map<string, vector<Message> >:: iterator end();
  void insert(std::pair<std::string, vector<Message> >);
  void clear();
  void push_back_message(string, Message);
  bool containsKey(string);
  string get_message(string,int);
  string list_messages(string);
  vector<Message> operator[](string);
private:
  map<std::string,std::vector<Message> > user_messages_map;
};
