import .basic monster
noncomputable theory
open monster 
open category_theory (mk_ob)
local infix ` ≅ `:60 := isomorphic 


/- the first happy family, a.k.a. Mathieu groups -/
/-- the Mathieu group M₁₁ -/
def M11 : Group := sorry
/-- the Mathieu group M₁₂ -/
def M12 : Group := sorry
/-- the Mathieu group M₂₂ -/
def M22 : Group := sorry
/-- the Mathieu group M₂₃ -/
def M23 : Group := sorry
/-- the Mathieu group M₂₄ -/
def M24 : Group := sorry

/- the second happy family -/
/-- the Conway group Co₁ -/
def Co1 : Group := sorry
/-- the Conway group Co₂ -/
def Co2 : Group := sorry
/-- the Conway group Co₃ -/
def Co3 : Group := sorry
/-- the McLaughlin group -/
def McL : Group := sorry
/-- the Higman–Sims group -/
def HS : Group := sorry
/-- the Janko group J₂ -/
def J2 : Group := sorry
/-- the Suzuki sporadic group	-/
def Suz : Group := sorry

/- THE THIRD HAPPY FAMILY -/

-- todo: move monster here

/-- The baby monster group B is defined as follows:
if x be any element in conjugacy class 2A, 
then the centralizer C_M(x) is 2 ⬝ B, so B ≅ C_M(x)/Z(C_M(x)) -/
def BabyMonster : Group :=
let C := conj_class Monster 2 'A' in
let x := classical.some C.1.2 in
let Cx : set Monster := centralizer {x} in
mk_ob $ quotient_group.quotient $ is_subgroup.center $ Cx

/-- Fi24 is characterized by 3 ⬝ Fi24 ≅ N_M(x) where x is any element in conjugacy class 3A. 
  The derived subgroup of this group is the sporadic group Fi24' -/
/- todo: double check that quotienting out the span of x indeed gives Fi24. -/
def Fi24 : Group := 
let C := conj_class Monster 3 'A' in
let x := classical.some C.1.2 in
let N_Mx : set Monster := normalizer $ group.closure {x} in
let span_x : set N_Mx := induced_subgroup (group.closure {x}) N_Mx in
by exact mk_ob (quotient_group.quotient span_x)

/-- The Fischer group Fi24' -/
def Fi24' : Group := 
mk_ob $ derived_subgroup Fi24

/-- the Fischer group Fi23 -/
def Fi23 : Group := sorry

/-- the Fischer group Fi22 -/
def Fi22 : Group := sorry

/-- the Thompson Group is C_M(x)/<x> for some element x in 3C -/
def Th : Group :=
let C := conj_class Monster 3 'C' in
let x := classical.some C.1.2 in
let C_Mx : set Monster := centralizer {x} in
let span_x : set C_Mx := induced_subgroup (group.closure {x}) C_Mx in
by exact mk_ob (quotient_group.quotient span_x)

/-- the Harada–Norton group	is C_M(x)/<x> for some element x in 5A -/
def HN : Group :=
let C := conj_class Monster 5 'A' in
let x := classical.some C.1.2 in
let C_Mx : set Monster := centralizer {x} in
let span_x : set C_Mx := induced_subgroup (group.closure {x}) C_Mx in
by exact mk_ob (quotient_group.quotient span_x)

/-- the Held group is C_M(x)/<x> for some element x in 7A -/
def He : Group := 
let C := conj_class Monster 7 'A' in
let x := classical.some C.1.2 in
let C_Mx : set Monster := centralizer {x} in
let span_x : set C_Mx := induced_subgroup (group.closure {x}) C_Mx in
by exact mk_ob (quotient_group.quotient span_x)

/- the pariahs  -/

/-- the Janko group J₁ -/
theorem J1_char : ∃!(G : Group.{0}), ∃(h : fintype G), 
by { exactI
  simple_group G ∧ 
  (∃(s : set G), is_Sylow_subgroup 2 s ∧ commutative_on s) ∧
  (∃x : G, x*x = 1 ∧ mk_ob (centralizer {x} : set G) ≅ 
    mk_ob (cyclic_group 2 × alternating_group 5)) } :=
omitted

def J1 : Group := classical.some J1_char

/-- the Janko group J₃ -/
def J3 : Group := sorry

/-- the Lyons group -/
def Ly : Group := sorry

/-- the O'Nan group	-/
def O'N : Group := sorry

/-- the Janko group J₄ -/
def J4 : Group := sorry

/-- the Rudvalis group -/
def Ru : Group := sorry
