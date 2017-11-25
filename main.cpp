#include <iostream>
#include "node.h"
extern Node* RootNode;
extern int yyparse();

void Dfs(Node* r, int nSpace) {
  for (int i = 0; i < nSpace; i++) {
    std::cout << " ";
  }

  std::cout << r->NodeType << "\t" << r->NodeValue << "\t" << r->NodeInfo << std::endl;

  nSpace += 4;
  int NumChil = r->Children.size();
  for (int i = 0; i < NumChil; i++) {
    Dfs(r->Children[i], nSpace);
  }
}

int main(int argc, char **argv)
{
    yyparse();
    Dfs(RootNode, 0);
    // std::cout << RootNode->NodeType <<std::endl;
    return 0;
}
